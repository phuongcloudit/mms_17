  $(document).ready(function() {
    $('#team_user_ids').select2();
    $('#team_leader_id').select2();
  });

  load_member_team ();

  function load_member_team () {
    $('#team_leader_id').find('option').not(':selected').remove();
    leader_selected = $('#team_leader_id').find('option:selected').val();
    $('#team_user_ids').find('option:selected').each(function() {
      if($(this).val()!= leader_selected )
        $('#team_leader_id').append('<option value="' + $(this).val() + '">' + $(this).text() + '</option>');
    });
  }

  $('#team_user_ids').on('change', function() {
    load_member_team ();
  });

  $('#team_user_ids').chosen({
    allow_single_deselect: true,
    width: '82%',
    no_results_text: I18n.t("admin.users.user.not_found_user")
  });
